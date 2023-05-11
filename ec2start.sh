!/bin/sh
aws ec2 run-instances --image-id ami-02eb7a4783e7e9317 --count 1 --instance-type t2.micro --key-name subashlinux --security-groups-ids sg-04a0297b29532c11f --region ap-south-1

