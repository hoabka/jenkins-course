  
![Add Node](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/overview.JPG)
    
## Task #1
Trong task này, bạn được yêu cầu tạo 1 Jenkins Slave container, sau đó add Jenkins slave này vào Jenkins master sử dụng SSH.  
    
## 1. Tạo Jenkins Slave container    
    
### 1.1.  Build Jenkins Slave Docker Image
```console
# Chuyển tới thư mục jenkins-slave
$ cd jenkins-course/jenkins-slave

# Build Docker Image với tag
$ docker build -t your_docker_registry/jenkins-slave:latest . 

# Login vào Docker Hub
$ docker login

# Push Image tới Registry
$ docker push your_docker_registry/jenkins-slave:latest
```
 **NOTE**: Chú ý thay your_docker_registry với tên của Registry của bạn. 
### 1.2.  Sửa install script để run Jenkins Slave
```console 
# Gen Keypair
$ ssh-keygen -t rsa # Lưu keypair ở thư mục đang làm việc

# Change Mode private key
$ chmod 400 id_rsa

# Sửa default image thành Image đã được build ở bước #1.1
$ sed -i 's/hoabka\/jenkins-slave:latest/your_docker_registry\/jenkins-slave:latest/g'

#Chạy script để tạo
$ sudo bash ./install_jenkins_slave.sh
``` 
### 1.3. Kiểm tra trạng thái của Jenkins Slave Container  
```console 
# Kiếm tra Container đã chạy thành công hay chưa
$ docker ps

# Kiểm tra kết nối ssh tới Jenkins Slave container
$ ssh -i id_rsa jenkins@localhost -p2222

# Trong trường hợp connection bị denied thì xóa file known_hosts đi
$ rm ~/.ssh/known_hosts

# Add Jenkins Slave container là trusted servers trên Master Jenkins
$ ssh-keyscan -p2222 PulicIP_Hosts > /var/jenkins_master_home/.ssh/known_hosts

```   
## 2. Thêm Jenkins slave node
### 2.1. Cài đặt SSH Credential
- Vào **Manage Jenkins** => **Manage Credentials** => Click **(global)** => **Add Credentials** . Chọn **Kind** là **SSH Username vs Private Key**.
- Chọn Username là **Jenkins**
- Phần Private Key copy nội dung của file **id_rsa** được gen ở bước **#1.1** và Save lại.
### 2.2. Add Jenkins Slave Node
- Vào **Manage Jenkins** => **Manage Nodes and Cloud** => **Add Node**
![Add Node](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/addNode.png)
    
- Điền thông tin theo của Slave Container

| Field | Giá trị  | Ý nghĩa|
|--|--|--|
| Name | Linux-Slave-01 | Tên của Node|
| Number of executors| 2 | Mỗi Executor sẽ chạy được 1 Job|
| Labels| Linux-Slave|Nhãn để lựa chọn Node build sau này|
| Launch method|Launch agents via SSH|Sử dụng SSH để kết nối tới Slave|
| Host|IP của Slave Node|IP để Master kết nối SSH tới|
| Credential|credential tạo ở #2.1|SSH private key và User|
| Port|2222|SSH Port|
| JavaPath|/usr/local/openjdk-14/bin/java|Đường dẫn tới Java Binary|

![Detail Informaton](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/addNodeDetailInfor.JPG)

![Detail Informaton](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/addNodeDetailInfor_2.JPG)
- Save thông tin và kiểm tra trạng thái của Slave
![Add Node](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/slaveStatus.JPG)

## 3. Trouble Shooting