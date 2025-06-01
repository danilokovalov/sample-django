resource "aws_instance" "app1" {
  ami = "ami-04a5bacc58328233d"
  instance_type = "t2.micro"
  user_data = file("user_data_app.sh")
  subnet_id = aws_subnet.private_app_1.id
  vpc_security_group_ids = [aws_security_group.sg_started_pack.id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  key_name = "bastion-key"
  depends_on = [
    aws_security_group.sg_started_pack,
    aws_iam_instance_profile.ssm_profile
  ]
}
resource "aws_instance" "app2" {
  ami = "ami-04a5bacc58328233d"
  instance_type = "t2.micro"
  user_data = file("user_data_app.sh")
  subnet_id = aws_subnet.private_app_2.id
  vpc_security_group_ids = [aws_security_group.sg_started_pack.id]
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  key_name = "bastion-key"
  depends_on = [
    aws_security_group.sg_started_pack,
    aws_iam_instance_profile.ssm_profile
  ]
}
resource "aws_instance" "db" {
  ami = "ami-04a5bacc58328233d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_db.id
  vpc_security_group_ids = [aws_security_group.sg_db_pack.id]
  user_data = file("user_data_db.sh")
  iam_instance_profile = aws_iam_instance_profile.ssm_profile.name
  key_name = "bastion-key"
  depends_on = [
    aws_security_group.sg_started_pack,
    aws_iam_instance_profile.ssm_profile
  ]
}