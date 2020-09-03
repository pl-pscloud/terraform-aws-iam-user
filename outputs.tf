output "pscloud_iam_user" {
  value = aws_iam_user.pscloud-iam-user
}

output "pscloud_access_key_encrypted" {
  value = var.pscloud_create_access_keys ? aws_iam_access_key.pscloud-iam-user-acsess-key[0].encrypted_secret : ""
}

output "pscloud_iam_user_console_password_encrypted" {
  value = var.pscloud_create_access_keys ? aws_iam_user_login_profile.pscloud-iam-user-login-profile[0].encrypted_password : ""
}