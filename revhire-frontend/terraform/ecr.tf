resource "aws_ecr_repository" "revhire-job-service-repo" {
  name                 = "revhire-job-service-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "revhire-user-service-repo" {
  name                 = "revhire-user-service-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

output "job-service-repo-Url" {
  value = aws_ecr_repository.revhire-job-service-repo.repository_url
}

output "user-service-repo-Url" {
  value = aws_ecr_repository.revhire-user-service-repo.repository_url
}