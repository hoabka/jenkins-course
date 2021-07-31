## Task #2 Trong task này, bạn được yêu cầu build một một nodejs webapp đơn giản.     
        
## 1. Cài đặt NodeJS plugin và npm ### 1.1.  Cài đặt NodeJS plugin  
- Vào mục **Manage Jenkins** => **Manage Plugins** => Chọn Tab **Available** và tìm **NodeJS** plugin.  
- Chọn Install without Restart và cài đặt.  
  
### 1.2.  Cài đặt npm  
- Vào mục **Manage Jenkins** => **Global Tool Configuration** => Tại phần **NodeJS** chọn **Add NodeJS** và chọn phiên bản **nodejs 12.0.0**  
  
## 2. Tạo Jenkins job  
- Chọn **New Item** và chọn **Freestyle project** đặt tên cho project và click **OK**  
![Create Freestyle Job](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/createJob.JPG)  
- Trong phần **Source Code Management** chọn tới link github của sample project  
![Source Course Config](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/selectSVC.JPG)  
- Trong phần **Build Environment** chọn **Provide Node & npm bin/ folder to PATH** chọn NodeJS Installation cài đặt ở bước **#1.2**  
- Trong phần **Build** chọn **Add build step** => chọn **Execute Shell**.  Trong phần nội dung của Shell điền command build `npm install`  
![Build Config](https://github.com/hoabka/jenkins-course/blob/master/jenkins-slave/images/buildENV.JPG)  
## 3. Build job  
- Click **Build  Now** và kiểm tra kết quả của quá trình build.  
## 4. Trouble Shooting