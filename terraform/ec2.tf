resource "aws_instance" "app1" {
  ami = "ami-03250b0e01c28d196"
  instance_type = "t3.micro"
  user_data = file("user_data_app.sh")
  subnet_id = aws_subnet.private_app_1.id
  vpc_security_group_ids = [aws_security_group.sg_started_pack.id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  depends_on = [
    aws_security_group.sg_started_pack,
    aws_iam_instance_profile.ssm_profile
  ]
}
resource "aws_instance" "app2" {
  ami = "ami-03250b0e01c28d196"
  instance_type = "t3.micro"
  user_data = file("user_data_app.sh")
  subnet_id = aws_subnet.private_app_2.id
  vpc_security_group_ids = [aws_security_group.sg_started_pack.id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  depends_on = [
    aws_security_group.sg_started_pack,
    aws_iam_instance_profile.ssm_profile
  ]
}
resource "aws_instance" "db" {
  ami = "ami-03250b0e01c28d196"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.private_db.id
  vpc_security_group_ids = [aws_security_group.sg_started_pack.id]
  user_data = file("user_data_db.sh")
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  depends_on = [
    aws_security_group.sg_started_pack,
    aws_iam_instance_profile.ssm_profile
  ]
}