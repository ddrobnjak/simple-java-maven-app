## 1 - Create Jenkins freestyle job for MVN project

### Add Credentials

### Add Maven Installation

1) From **Jenkins Dashboard** go to **Manage Jenkins** -> **Global Tool Configuration**
2) Find **Maven** section and click **Add Maven**
3) Add name for Maven installation, check **Install automatically**, click **Add Installer** and then select **Install from Apache**, select desired version, then **Apply** changes

### Create freestyle job

1) Go to **Jenkins Dashboard** and click **New Item**, enter Item Name and choose **Freestyle project**
2) In Source Code Management section select **Git**, provide Repository URL and Credentials created in previous steps, and select which Branch to build
3) In Build Steps choose **Invoke top-level Maven targets**, for Maven Version select Maven Installation created in previous steps and for Goals enter `clean package`
4) **Save** changes and then click **Build now**
## 2 - Create Jenkins pipeline job for MVN project

## 3 - Create multi-stage Docker file for MVN project
