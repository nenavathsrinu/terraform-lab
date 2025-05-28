 resource "aws_s3_bucket" "archive" {
     bucket = "mysri-test-arch-${random_string.rname[count.index].result}"
    count = "2"
    object_lock_enabled = false

    tags = {
        Name = "mysri-test-arch-${count.index}"
        Env  = "Dev"
    }
  
}

resource "random_string" "rname" {
    length = 16
    count  = 2
    special = false
    upper = false 

}

