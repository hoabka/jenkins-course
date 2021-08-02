![Overview Multibranch Pipeline](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/overview.JPG)  
  
## Task #1  
Trong task này, bạn được yêu cầu cấu hình **Webhook** trên **Gitlab** và Webhook này được trigger để chạy Jenkins Multibranch pipeline.    
## Prequisites  
| Yêu cầu |  Version|  
|--|--|  
| Tạo tài khoản gitlab.com | N/A |  
| Tạo project nodejs-demo trên gitlab.com | N/A |  
| Tạo Jenkinsfile trong project nodejs-demo| N/A |  
  
  
## 1. Cấu hình Webhook, Credentials 
### 1.1.  Cài đặt Gitlab Branch Source plugin on Jenkins  
- Gitlab branch source plugin là plugin để quản lý Gitlab configuration trên Jenkins và cho phép thêm các Branch sources trên Gitlab vào Jenkins multibranch pipeline.  
- Chọn mục **Manage Jenkins** => **Manage Plugins** => Chọn Tab **Available** => Tìm Plugin **Gitlab Branch Source** => Sau đó nhấn cài đặt (**Install Without Restart**)  
  
![Install Plugin](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/installPlugin.JPG)  
  
### 1.2.  Tạo Gitlab Access Token  
- Gitlab Access Token được tạo ra để nhằm cung cấp cho Jenkins Controller để có thể tương tác được với Gitlab.  
- Chọn biểu tượng góc trên bên phải màn hình (Mục quản lý tài khoản) và chon **Preference**  
  
![Account Preference](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/createPAT_1.JPG)  
  
- Chọn **Access Tokens** => Đặt tên cho Access Token này và chọn Scope **api** => Click tạo **create personal access token**  
  
![Create Personal Access Token](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/createPAT_2.JPG)  
  
- Copy và lưu Token lại để dùng cho các phần sau.  
  
![Create Personal Access Token](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/savePAT.JPG)  
  
### 1.3.  Cấu hình SSH Key trên Gitlab  
- Gen SSH keypair  
```console  
$ ssh-keygen -t rsa  
```  
- Copy nội dung của Public Key (**id_rsa.pub**)  
```console  
$ cat ./id_rsa.pub  
```  
- Vào muc **SSH Keys** sau đó Paste nội dung của Public Key vào và chọn **Add key**.  
  
![Add SSH Key to Gitlab](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/addSSHKeyGitlab.JPG)  
  
### 1.4.  Cấu hình Credentials trên Jenkins  
#### 1.4.1. Cấu hình Gitlab Personal Access Token  
- Chọn mục **Manage Jenkins** => **Manage Credentials** => Chọn **(global)** => **Add Credentials** => Chọn Kind **Gitlab Personal Access Token**. Sau đó điền **Token** được lưu ở bước **1.2**. Điền ID và Description và click **OK**

![Add Personal Access Token credentail](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/addPATtoJenkins.JPG)  
  
#### 1.4.2. Cấu hình SSH Key  
- Tiếp sau bước **1.4.1** chọn **Add Credentials**. Chọn Kind **SSH Username with private key**.  Mục username chọn tên user gitlab (user được dùng để add SSH key ở bước **1.3**).  
- Phần Private key, copy nội dung của Private key **id_rsa** được gen ở bước **1.3** và paste vào phần **Private Key**.  
  
![Add SSH credentail](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/addSSHCredentialtoJenkins.JPG)  

#### 1.4.3. Cấu hình Gitlab Server  
- Chọn mục **Manage Jenkins** => **Configuration System** => Xuống phần **GitLab** => Chọn Add **GitLab Server** => **GitLab Server** 
-  Các thông tin cần điền được mô tả dưới đây 

| Trường  | Giá trị | Ghi chú |  
|-|-|-|
| Display Name | gitlab-server  | Tên hiển thị của GitLab Server |  
| Server URL | https://gitlab.com/  | Đường dẫn URL của GitLab server |  
| Credentials | gitlab-pat | Tên của Credentail tạo bởi Personal Access Token ở bước  **1.4.1** |  
| Manage Web Hooks | Yes | Cho phép Jenkins Server quản lý Webhook của GitLab (Tạo mới) |  
| Secret Token | bPO8wsetLJHnxkBlcVdg | Token này dùng để xác thực Webhook Payload và có thể Generate tùy ý |
| Root URL for hooks | https://53412af07ffd.ngrok.io | Để url của **ngrok** trỏ tới Jenkins Master |    
  
![Config GitLab Serverl](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/configGitlabServer.JPG)  
  
- Sau khi Config xong, kiểm tra lại Connection xem đã kết nối thành công hay chưa.  
  
![Test Connection GitLab Server](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/testConnection.JPG)  
  
## 2. Tạo Jenkins multibranch pipeline 
### 2.1. Tạo Multibranch Pipeline
- Fork [gitlab project](https://gitlab.com/hoabka/nodejs-demo.git) về repo gitlab cá nhân.

![Fork Repo](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/forkRepo.JPG)

- Trên Jenkins server chọn **New Item** => Chọn **Multibranch Pipeline** => Click **OK**  
  
![Create Multibranch Job](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/newItem.JPG)  
  
- Mục **Branch Sources** => chọn **Add source** => chọn **Gitlab project**  
- Mục **Checkout Credentials** chọn Credential để Checkout code ở bước **1.4.2**  
- Mục **Owner** chọn tên account GitLab.  
- Mục **Projects** chọn project được droplist xuống  
  
![Config Branch Source](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/configBranchSource.JPG)  
  
- Các mục khác để mặc định và Click **Save**  
- Kiểm tra xem các Branch đã được Jenkins Scan thành công hay chưa  
  
![Scan Log](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/scanLog.JPG)  
  
![Scan Log](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/scanCompleted.JPG)  
 
 

> Lưu ý: Trong trường hợp chưa có Jenkinsfile ở nhánh nào thì việc Scan sẽ không hiển được pipeline với nhánh đó.

 
### 2.2. Tạo Commit để Trigger Webhook
- Tạo nhánh feature, sửa file code và commit
```
# Checkout nhánh master
$ git checkout master

# Tạo nhánh mới từ master 
$ git checkout -b feature-01

# Sửa file index.js tùy ý sau đó commit và push lên nhánh feature-01

$ vi index.js
$ git add .
$ git commit -am "Modify index.js"
$ git push orgin feature-01
```
- Tạo Merge Requesst trên Gitlab để merge nhánh **feature-01** vào nhánh **dev**

![Create MR](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/createMR.JPG) 

![MR Trigger Pipeline](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/mrTriggerJenkins.JPG)

- Jenkins pipeline được Trigger và chạy trên nhánh **MR-***

![MR Trigger Pipeline Jenkins](https://github.com/hoabka/jenkins-course/blob/master/jenkins-multibranch/images/pipelineMRTrigger.JPG)

## 3. Troubleshooting