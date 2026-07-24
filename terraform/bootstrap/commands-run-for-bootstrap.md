gcloud projects create ss-bootstrap-prj \
    --name="SalmanStack Bootstrap" \
    --organization=1066568188007



## Below command is used to link the billing with above project
gcloud beta billing projects link ss-bootstrap-prj \
    --billing-account=01C5E6-EA4820-1EC2A0

#now we have to set it active Project
gcloud config set project ss-bootstrap-prj

# now we have to verify it 

gcloud config get-value project

#Expected output  is
ss-bootstrap-prj

## now we have enable APIs we will need
 
gcloud services enable \
    cloudresourcemanager.googleapis.com \
    iam.googleapis.com \
    serviceusage.googleapis.com \
    storage.googleapis.com


