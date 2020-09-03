resource "aws_iam_user" "pscloud-iam-user" {
  name = var.pscloud_username
  path = var.pscloud_username_path

  tags = {
    Name = "${var.pscloud_company}_iam_user_${var.pscloud_env}_${var.pscloud_username}"
  }
}

resource "aws_iam_user_login_profile" "pscloud-iam-user-login-profile" {
  count   = var.pscloud_console_access ? 1 : 0

  user    = aws_iam_user.pscloud-iam-user.name
  pgp_key = "keybase:${var.pscloud_keybase_username}"
}

resource "aws_iam_access_key" "pscloud-iam-user-acsess-key" {
  count   = var.pscloud_create_access_keys ? 1 : 0

  user    = aws_iam_user.pscloud-iam-user.name
  pgp_key = "keybase:${var.pscloud_keybase_username}"
}
