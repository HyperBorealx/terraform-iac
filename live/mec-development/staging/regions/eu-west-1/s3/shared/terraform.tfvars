buckets = {
  phoenix-mec-backup = {
    bucket                                = "phoenix-mec-backup"
    attach_deny_insecure_transport_policy = false
    tags = {
      BusinessGroup = "DevOps"
      Owner         = "DevOps"
      DRI           = "DevOps"
      Environment   = "Staging"
      ComputeType   = "S3"
      SLALevel      = "Tier3"
    }
  }

  phoenix-mec-staging = {
    object_ownership = "ObjectWriter"
    bucket           = "phoenix-mec-staging"
    grant = [
      {
        permission   = "FULL_CONTROL"
        type         = "CanonicalUser"
        id           = "dc6a4d8a3428c4be5f1f91117dbc0706bd6f01da123458a07743ecc6aedfad0f"
        display_name = "aws.dev.mec"
      },
      {
        permission   = "FULL_CONTROL"
        type         = "CanonicalUser"
        id           = "2374c50a9043be10c1bcb0e8fde771bbe26d8f5dbfdfa49aff65244d035ea08a"
        display_name = "aws.shared.services"
      }
    ]


    attach_policy                         = true
    attach_deny_insecure_transport_policy = false # cannot do this since attaching policy directly
    policy                                = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::phoenix-mec-staging/*"
    },
    {
      "Sid": "CodeBuildPutObject",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::300476207176:role/phoenix-ss-phoenix-generator-tm-codepipeline-iam-role"
      },
      "Action": "s3:*",
      "Resource": "arn:aws:s3:::phoenix-mec-staging/*"
    },
    {
      "Sid": "tm-deployment",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::phoenix-mec-staging",
        "arn:aws:s3:::phoenix-mec-staging/*"
      ],
      "Condition": {
        "ArnLike": {
          "aws:PrincipalArn": [
            "arn:aws:iam::300476207176:role/*-staging-deployment",
            "arn:aws:iam::300476207176:role/phoenix-staging-triggered-brand-build-codebuild-role",
            "arn:aws:iam::300476207176:role/phoenix-staging2-triggered-brand-build-codebuild-role",
            "arn:aws:iam::300476207176:role/phoenix-staging3-triggered-brand-build-codebuild-role",
            "arn:aws:codebuild:eu-west-1:300476207176:project/qc-automation-aicme-backup-build",
            "arn:aws:iam::300476207176:role/qc-automation-aicme-blue-green-codebuild-role",
            "arn:aws:iam::300476207176:role/*-staging2-deployment"
          ]
        }
      }
    },
    {
      "Sid": "3",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E9ZP97O6ECN7A"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::phoenix-mec-staging/*"
    },
    {
      "Sid": "AllowCloudFrontServicePrincipal",
      "Effect": "Allow",
      "Principal": {
        "Service": "cloudfront.amazonaws.com"
      },
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::phoenix-mec-staging/*",
      "Condition": {
        "StringEquals": {
          "AWS:SourceArn": [
            "arn:aws:cloudfront::205551755912:distribution/E22KIKJ202IBCL",
            "arn:aws:cloudfront::205551755912:distribution/E1M57ZI0S5V451",
            "arn:aws:cloudfront::205551755912:distribution/E3KCB5IJKNG70H",
            "arn:aws:cloudfront::205551755912:distribution/E3IEZ7A8CG369J",
            "arn:aws:cloudfront::205551755912:distribution/ENQF8077V8AJW",
            "arn:aws:cloudfront::205551755912:distribution/E12EPKZZCYOBKU",
            "arn:aws:cloudfront::205551755912:distribution/E1DX9TJCGIKBG1",
            "arn:aws:cloudfront::205551755912:distribution/E3EYSB8E8ZL0N7",
            "arn:aws:cloudfront::205551755912:distribution/E1H1WGIDIMSNM7",
            "arn:aws:cloudfront::205551755912:distribution/E1ZJFKYQPKD44",
            "arn:aws:cloudfront::205551755912:distribution/EBRZGSDWA6XP7",
            "arn:aws:cloudfront::205551755912:distribution/E2O13UWXIF63C",
            "arn:aws:cloudfront::205551755912:distribution/E34L1J6AQJPB3H",
            "arn:aws:cloudfront::205551755912:distribution/E2YRG2SBRZR17K",
            "arn:aws:cloudfront::205551755912:distribution/E3LETUZ3QOSHW3",
            "arn:aws:cloudfront::205551755912:distribution/E31LB67XHTTGDY",
            "arn:aws:cloudfront::205551755912:distribution/ERS1F82U3G2T5",
            "arn:aws:cloudfront::205551755912:distribution/ELDALH2AVEDJ7",
            "arn:aws:cloudfront::205551755912:distribution/E22KIKJ202IBCL",
            "arn:aws:cloudfront::205551755912:distribution/E2INVL0XK1NF22",
            "arn:aws:cloudfront::205551755912:distribution/E1RS2HDL3XT8CS",
            "arn:aws:cloudfront::205551755912:distribution/EKV4X7QMYCK3S",
            "arn:aws:cloudfront::205551755912:distribution/E2TXI5Z8LJU7MY",
            "arn:aws:cloudfront::205551755912:distribution/EW08I4CDU7N9U",
            "arn:aws:cloudfront::205551755912:distribution/E3KCB5IJKNG70H",
            "arn:aws:cloudfront::205551755912:distribution/E17KUSA3QX6CCD",
            "arn:aws:cloudfront::205551755912:distribution/E1JSMH1LO79563"
          ]
        }
      }
    }
  ]
}
EOF

    cors_rule = [
      {
        "allowed_headers" : [
          "*"
        ],
        "allowed_methods" : [
          "GET"
        ],
        "allowed_origins" : [
          "https://staging.peervoice.com",
          "http://staging-s.peervoice.com",
          "https://staging-s.peervoice.com",
          "https://staging-s.md-fi.com",
          "http://staging-s.md-fi.com",
          "https://staging-ui.firstwordedge.com",
          "http://staging-ui.firstwordedge.com",
          "http://staging.md-fi.com",
          "https://staging.md-fi.com",
          "http://staging.api.md-fi.com",
          "https://staging.api.md-fi.com",
          "https://staging.courses.peerview.com",
          "http://sample-site.phnxml.io",
          "https://sample-site.phnxml.io/",
          "https://staging.api.phnxml.io",
          "https://staging.api.phnxml.io/"
        ],
        "expose_headers" : []
      }
    ]
  }
}
