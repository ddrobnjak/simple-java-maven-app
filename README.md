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

1) Go to **Jenkins Dashboard** and click **New Item**, enter Item Name and choose **Pipeline**
2) Create Jenkinsfile on Repository and add pipeline code inside
3) In Pipeline section select **Pipeline script from SCM** and choose **Git**
4) Provide Repository URL and Credentials created in previous steps, and select which Branch to build and fill Script path with path to Jenkinsfile on Repository
5) **Save** changes and click **Build now**


## 3 - Create multi-stage Docker file for MVN project

1) Install docker on Jenkins host
2) Create Dockerfile on Repository with following docker instructions

```
FROM maven:3.5-jdk-8-alpine as builder                                          //choose base image for stage 1 (build)
                                                      
COPY src /usr/src/app/src                                                       //copy source and pom.xml file from workspace to container    
COPY pom.xml /usr/src/app

RUN mvn -f /usr/src/app/pom.xml clean package                                   //execute command to build maven project inside container

FROM openjdk:8                                                                  //choose base image for stage 2
  
COPY --from=builder /usr/src/app/target/my-app-1.0.jar /usr/app/my-app-1.0.jar  //copy artifact from stage 1

ENTRYPOINT ["java", "-cp", "/usr/app/my-app-1.0.jar", "com.mycompany.app.App"]  //start app on docker container
```
