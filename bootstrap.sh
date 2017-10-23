#!/usr/bin/env bash

#Cassandra Repo
#cp /vagrant/cassandra.repo /etc/yum.repos.d/cassandra.repo

#elastic search signature
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

#elastic search repo
cp /vagrant/elasticsearch.repo /etc/yum.repos.d/elasticsearch.repo

#Update Repo
yum -y update

#Install Cassandra
#yum install -y cassandra

#Install ElasticSearch and JDK
yum install -y vim java-1.8.0-openjdk.x86_64 elasticsearch

systemctl daemon-reload
systemctl enable elasticsearch.service

cp /vagrant/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

systemctl start elasticsearch.service
service  elasticsearch status

#Open Firewall port
firewall-cmd --zone=public --add-port=9200/tcp

firewall-cmd --zone=public --add-port=9300/tcp