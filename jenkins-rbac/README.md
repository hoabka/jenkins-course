
![Overview](https://github.com/hoabka/jenkins-course/blob/master/jenkins-rbac/images/Jenkins-RBAC.png)

## Task 1
Trong task này mục tiêu bạn sẽ tạo được users và sau đó gán quyền cho user này.

### Kiến thức
Plugin **Role-based Authorization Strategy** cho phép quản **Role** và phân quyền cho **Users**

 Một số concepts:
  
- **Global roles** cho phép quản lý tác vụ chung, Agent, Job, Run và SCM permission ở mức Global
- **Project roles** cho phép thiết lập permision cho các Job, Run theo một project cụ thể.
- **Agent role** cho phép thiết lập permission liên quan tới Node, Agent
- Gán roles cho users và groups

Prequisites
------------------------------  
1. Cài đặt Jenkins
2. Tạo Job bất kỳ và được đặt tên là **Test-01**

Installation and Authorization  
------------------------------  
  
Cài đặt plugin;  
  
 Truy cập **Manage Jenkins** > **Manage Plugins** > **Available**  và search "[Role-based Authorization Strategy](https://plugins.jenkins.io/role-strategy)", check the box và click on **Install without restart** button.

![](https://miro.medium.com/max/1400/1*mn2jn-LpPw4-qdQKyYo_KA.png)  
  
  
 Sau khi cài đặt thành công Plugin cần bật chế độ phân quyền sử dụng Pluging này.
 Go to **Manage Jenkins** > **Configure Global Security**, kéo xuống phần  **Authorization**  chọn **Role-Based Strategy option**,  như hình dưới đây.  
  
![](https://miro.medium.com/max/1400/1*S8XNvc7tjqFwwjs40Tm1JA.png)  
  
User Creation  
-------------  

Go to **Manage Jenkins** > **Manage Users** > **Create Users** như hình dưới đây.  
  
![](https://miro.medium.com/max/1400/1*OrYTcUvB7-XLOD66Wbg65A.png)  
  
Truy cập trang Jenkins UI (**IP:8080**), cung cấp thông tin đăng nhập cho **test_user**. Màn hình dưới đây xác nhận user này không có quyền truy cập vào bất cứ resources này của Jenkins
  
![](https://miro.medium.com/max/1400/1*tI7_awKXgc0KBZS1ZpeLGg.png)  
  
Manage and Assign Roles  
-----------------------  
  
Go to **Manage Jenkins** kéo xuống dưới cùng và click on **Manage and Assign Roles** > **Manage Roles**  
  

> Note:\
Nếu như không nhìn thấy mục **Manage and Assign Roles**  thì cần kiểm tra xem đã cài lại Plugin hay chưa [Role-based Authorization Strategy](https://plugins.jenkins.io/role-strategy).  
  
Trong phần **Manage Roles** sẽ có 2 phần, một là **Global roles** và phần còn lại là **Item roles** hãy bắt đầu với **Global roles**
  
**Global roles**:\
Ở **Global roles** section thêm một **role** mới đặt tên là **Employee** và gán quyền **Read** trong **Overall** Section như hình dưới đây;  
  
![](https://miro.medium.com/max/1400/1*TIKSg3koLyaGAZ5s_V5xoQ.png)  
  
**Item roles**:\
Bên dưới mục Items roles, thêm một role mới và đặt pattern cho role mới này. Trong ví dụ, role được tạo ra có tên là Test_Devs và pattern **Test-.*** nhằm chỉ định các Job, Projects khớp với pattern này và sẽ được gán quyền cho users như mô tả hình dưới đây:
  
![](https://miro.medium.com/max/1400/1*Wur4V3hcSBsrFa38SQIFqg.png)  
  
**Assign Roles**:\
Go to **Manage Jenkins** > **Manage and Assign Roles** > **Assign Roles** tại đây chúng ta sẽ phải làm việc với **Global roles** và **Item roles**
  
**Global roles**:\
Điền tên của user (**test_user**) và **Add**. Tích chọn **Employee role**
  
![](https://miro.medium.com/max/1400/1*GA_RbNPouV1SQ6Z3MLmljQ.png)  
  
**Item roles**:\
Ở mục này, cung câp tên user (**test_user**) và **Add**. Sau đó tích chọn **Test_DEVs** role
  
![](https://miro.medium.com/max/1400/1*QHF9gMpAu-xiDuvXUIZLGg.png)  
  
Login lại vào Jenkins để kiểm tra xem Users đã được phân quyền đúng hay chưa. Nếu thành công, error lúc ban đầu sẽ biến mất, user sẽ nhìn thấy Job **Test-01** 
  
![](https://miro.medium.com/max/1400/1*ZmKD1oM_NDG4Mi_CytkxWA.png)

End Lab
------------- 