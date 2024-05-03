output "frontend_instance" {
  value = aws_instance.frontend_instance.id
}

output "backend_instance" {
  value = aws_instance.backend_instance.id
}