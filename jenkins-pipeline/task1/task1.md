![Overview](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/overview.png)
## Task #1
Trong task này, bạn được yêu tạo 1 Helloworld pipeline.  
    
## 1. Tạo Jenkins Pipeline  
### 1.1.  Tạo pipeline
- Chọn **New Item** => Chọn **Pipeline** => Click **OK**
- Mục **Pipeline** => Chọn **Pipeline script from SCM** => Chọn **Git**.
- Phần **Repository URL** chọn tới Repository chứa Jenkinsfile.

> Repository chứa Jenkinsfile là repo được fork về từ repo **jenkins-course** trong phần **jenkins-installation**

 
![Pipeline Config](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/pipelineConf.JPG)

- Phần **Script Path** để đường dẫn tương đối tới **Jenkinsfile** của **Task #1**

![Jenkinsfile Path](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/jenkinsfilePath.JPG)

- Click **SAVE**
### 1.2.  Run pipeline
- Click **Build Now**

![Build Now](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/buildNow.JPG)

- Check trong Log của Job build và kiểm tra xem Jenkinsfile có được thực thi đúng hay không

![Build Result](https://github.com/hoabka/jenkins-course/blob/master/jenkins-pipeline/images/buildResult.JPG)

### Task #1 Completed

## 2. Trouble Shooting  