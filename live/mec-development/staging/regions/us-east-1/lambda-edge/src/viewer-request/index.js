exports.handler = async (event) => {
    const request = event.Records[0].cf.request;
    const headers = request.headers;

    if (request.uri !== '/' && request.uri.endsWith('/')) {
        request.uri = request.uri.slice(0, -1);
    }

    headers['x-forwarded-from'] = [{
        key: 'X-Forwarded-From',
        value: 'CloudFront-Lambda@Edge'
    }];

    const userAgent = headers['user-agent'] ? headers['user-agent'][0].value : '';
    if (userAgent.includes('Mobile')) {
        headers['x-device-type'] = [{
            key: 'X-Device-Type',
            value: 'mobile'
        }];
    } else {
        headers['x-device-type'] = [{
            key: 'X-Device-Type',
            value: 'desktop'
        }];
    }

    if (request.uri.startsWith('/old-path/')) {
        const response = {
            status: '301',
            statusDescription: 'Moved Permanently',
            headers: {
                location: [{
                    key: 'Location',
                    value: request.uri.replace('/old-path/', '/new-path/')
                }]
            }
        };
        return response;
    }

    if (request.uri.endsWith('/')) {
        request.uri += 'index.html';
    }

    console.log(`Processing viewer request for URI: ${request.uri}`);

    return request;
};