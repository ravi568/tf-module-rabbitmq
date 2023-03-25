resource "aws_spot_instance_request" "rabbitmq" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"
  subnet_id = var.subnet_ids[0]
  wait_for_fulfillment = true

  tags = merge(
    var.tags,
    {Name = "${var.env}-rabbitmq"}
  )
}