resource "aws_instance" "this" {
  for_each              =  var.instances

  ami                   = each.value.ami
  instance_type         = each.value.instance_type
  subnet_id             = try(each.value.subnet_id, null)

  dynamic "cpu_options" {
    for_each = each.value.cpu_options != null ? [each.value.cpu_options] : []
    content {
      core_count        = cpu_options.value.core_count
      threads_per_core  = cpu_options.value.threads_per_core
    }
  }

  tags                  = merge({Name = each.key}, each.value.tags)
}
