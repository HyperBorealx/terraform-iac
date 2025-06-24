resource "cloudflare_zero_trust_tunnel_cloudflared" "this" {
  account_id = "ceddc6c7bb12e48bd2e5048551f20bc1"
  name       = "shared-services-tunnel"
  secret     = random_id.cloudflared_tunnel_secret.b64_std
  config_src = "local"
}

resource "random_id" "cloudflared_tunnel_secret" {
  byte_length = 32
}

resource "aws_secretsmanager_secret" "this" {
  name        = "shared-services/application-static-secrets/cloudflare-tunnel"
  description = "Cloudflare Tunnel secret for shared services"
  tags = {
    ResourceType = "EKS"
    Name         = "shared-services-prod"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id
  secret_string = jsonencode({
    "tunnel_id"    = cloudflare_zero_trust_tunnel_cloudflared.this.id
    "tunnel_token" = cloudflare_zero_trust_tunnel_cloudflared.this.tunnel_token,
    "cname"        = cloudflare_zero_trust_tunnel_cloudflared.this.cname
  })
}
