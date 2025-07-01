import {
  id = "i-06640a06d946084bb"
  to = module.ec2.module.ec2["s88nsp005"].aws_instance.this[0]
}

import {
  id = "i-00c2e9ec795ef5a17"
  to = module.ec2.module.ec2["s88nsp006"].aws_instance.this[0]
}

import {
  id = "vol-0807c274d10742b70"
  to = module.ec2.aws_ebs_volume.this["s88nsp006-xvdb"]
}

import {
  id = "xvdb:vol-0807c274d10742b70:i-00c2e9ec795ef5a17"
  to = module.ec2.aws_volume_attachment.this["s88nsp006-xvdb"]
}

import {
  id = "i-0653b391a1e55b9bf"
  to = module.ec2.module.ec2["S88DCP001"].aws_instance.this[0]
}

import {
  id = "i-0005eef363759bb8a"
  to = module.ec2.module.ec2["S88DCP002"].aws_instance.this[0]
}

import {
  id = "i-0a2eed27d0b7e2a70"
  to = module.ec2.module.ec2["s88app907"].aws_instance.this[0]
}

import {
  id = "i-00301b2ac1e2557c6"
  to = module.ec2.module.ec2["s88app908"].aws_instance.this[0]
}

