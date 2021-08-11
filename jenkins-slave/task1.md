  
![Overview](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/overview.JPG)
    
## Task #1
Trong task này, bạn được yêu cầu tạo 1 Jenkins Slave container, sau đó add Jenkins slave này vào Jenkins master sử dụng SSH.  
    
## 1. Tạo Jenkins Slave container   
    
### 1.2.  Sửa install script để run Jenkins Slave
- Tạo cặp keypair để cho **Jenkins Master** có thể kết nối được tới **Jenkins Slave** qua **SSH**
```console 
# Di chuyển tới thư mục của Hands-on
$ cd jenkins-course/jenkins-slave/scripts

# Gen keypair và lưu tại thư mực đang làm việc
$ ssh-keygen -t rsa

# Change mode private key
$ chmod 400 id_rsa

# Chạy script để tạo cài đặt Jenkins Slave
$ sudo bash ./install_jenkins_slave.sh
``` 
### 1.3. Kiểm tra trạng thái của Jenkins Slave Container  
```console 
# Kiếm tra Container đã chạy thành công hay chưa
$ docker ps

# Kiểm tra kết nối ssh tới Jenkins Slave container
$ ssh -i id_rsa jenkins@localhost -p2222

# Thoát khỏi Jenkins Slave Ctrl + D
# Trong trường hợp connection bị denied thì xóa file known_hosts đi
$ rm ~/.ssh/known_hosts

# Lấy IP của Node mà Jenkins Slave đang chạy trên đó
$ ifconfig

# Tạo thư mục .ssh trên
$ mkdir -p /var/jenkins_home/.ssh

# Add Jenkins Slave là trusted servers trên Jenkins Master
$ ssh-keyscan -p2222 jenkins_slave_node_ip > /var/jenkins_home/.ssh/known_hosts

```   
## 2. Thêm Jenkins slave node
### 2.1. Cài đặt SSH Credential
- Vào **Manage Jenkins** => **Manage Credentials** => Click **(global)** => **Add Credentials** . Chọn **Kind** là **SSH Username vs Private Key**.
- Chọn Username là **Jenkins**
- Phần Private Key copy nội dung của file **id_rsa** được gen ở bước **#1.1** và Save lại.

![Add SSH Credential](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/addSlaveSSHCredential.JPG)

### 2.2. Add Jenkins Slave Node
- Vào **Manage Jenkins** => **Manage Nodes and Cloud** => **New Node**

    
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

### Task #1 Completed
## 3. Trouble Shooting
