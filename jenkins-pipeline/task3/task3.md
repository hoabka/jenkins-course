## Task #3  
Trong task này, bạn được yêu cầu tạo 1 Jenkins Pipeline. Pipeline này thực hiện kéo code từ 1 [repo](https://github.com/hoabka/nodejs-demo.git) khác về sau đó thực hiện quá trình Build Docker Image và đẩy lên Docker Hub  
      
## 1. Tạo Jenkins Pipeline  
### 1.1.  Tạo Docker credential  
- Vào mục **Manage Jenkins** => **Manage Credentials** =>  Chọn domain **blobal** và chonj **Add Credentials**  
- Ở phần **Kind** chọn **Secret text**. Điền **Docker Registry** username vào phần **Secret**. Phần ID điền là **DOCKER_REGISTRY_USERNAME**.  
- Làm tương tự cho password của Docker Registry với ID là **DOCKER_REGISTRY_PASSWORD** và **REGISTRY_NAME**  
  
![Docker Credentials](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/dockerRegistryCred.JPG)  
```  
*** Lưu ý. Trong trường hợp thay đổi các ID khác thì cần thay đổi biến trong Jenkinsfile  
```  
### 1.2.  Tạo Jenkins Pipeline  
- Chọn **New Item** => Chọn **Pipeline** => Click **OK**  
- Mục **Pipeline** => Chọn **Pipeline script from SCM** => Chọn **Git**.  
- Phần **Repository URL** chọn tới [Repository](https://github.com/hoabka/jenkins-course.git) chứa Jenkinsfile.  
  
![Pipeline Config](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/pipelineConf.JPG)  
- Phần **Script Path** để đường dẫn tương đối tới **Jenkinsfile** của **Task #3**  
  
![Jenkinsfile Path](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/jenkinsfilePath.JPG)  
- Click **SAVE**  
- Jenkinsfile Environment  
```console  
environment {    
    REGISTRY_NAME            = credentials('REGISTRY_NAME')     
    DOCKER_REGISTRY_USERNAME = credentials('DOCKER_REGISTRY_USERNAME')    
DOCKER_REGISTRY_PASSWORD = credentials('DOCKER_REGISTRY_PASSWORD') }  
```  
*** Chú ý: Các biến Docker credentials cần sửa nếu bạn sử dụng tên ID khác ở bước **# 1.1**  
  
```console  
*** Lưu ý. Các thông tin Credential tuyệt đối không được để trong Jenkinsfile dạng Plain text hoặc up lên SVC.  
```  
### 1.3.  Run pipeline  
- Click **Build Now**  
- Check trong Log của Job build và kiểm tra xem Jenkinsfile có được thực thi đúng hay không  
## 2. Trouble shooting