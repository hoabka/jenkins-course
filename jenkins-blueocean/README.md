![Overview BlueOcean](https://github.com/hoabka/jenkins-course/blob/master/jenkins-blueocean/images/overview.gif)

## 1. Cài đặt Plugin
### 1.1.  Cài đặt Blue Ocean plugin on Jenkins  
- Chọn mục **Manage Jenkins** => **Manage Plugins** => Chọn Tab **Available** => Tìm Plugin **Blue Ocean** => Sau đó nhấn cài đặt (**Install Without Restart**)  
- Kiểm tra Blue Ocean đã cài đặt thành công hay chưa bằng cách vào 1 Pipeline bất kỳ và chọn **Open Blue Ocean**. Giao diện của hiển thị ra lịch sử các lần Build (**Build History**)

![Build History](https://github.com/hoabka/jenkins-course/blob/master/jenkins-blueocean/images/buildHistory.JPG)

### 1.2. Sử dụng giao diện của Blue Ocean để theo dõi Pipeline
- Trong giao diện **Build History**, chọn bất kỳ một bản build và Pipeline chi tiết sẽ được hiển thị ra.

![Pipeline Blueocean](https://github.com/hoabka/jenkins-course/blob/master/jenkins-blueocean/images/pipelineBlueocean.JPG)

- Pipeline hiển thị trên Blue Ocean giúp dễ dàng cho việc phát hiện lỗi trong một Pipeline phức tạp.

### 1.3. Chạy Job và theo dõi trạng thái trên Blue Ocean
- Sử dụng một Job **Build History** bất kỳ và chạy lại nó để theo dõi trạng thái của Job qua giao diện Blue Ocean

![Rerun Job](https://github.com/hoabka/jenkins-course/blob/master/jenkins-blueocean/images/rerunJob.JPG)

- Theo dõi trạng thái của Job trên Blue Ocean

![Job status](https://github.com/hoabka/jenkins-course/blob/master/jenkins-blueocean/images/jobStatus.JPG)

### Completed Blue Ocean task