import {
  id = "i-025dc3e0aef1d7798"
  to = module.ec2.module.ec2["S95NSP102"].aws_instance.this[0]
}

import {
  id = "i-027f1cd6e869b58b3"
  to = module.ec2.module.ec2["S95NSP009"].aws_instance.this[0]
}

import {
  id = "vol-076e8604c5d0c9a45"
  to = module.ec2.aws_ebs_volume.this["S95NSP009-xvdf"]
}

import {
  id = "xvdf:vol-076e8604c5d0c9a45:i-027f1cd6e869b58b3"
  to = module.ec2.aws_volume_attachment.this["S95NSP009-xvdf"]
}

