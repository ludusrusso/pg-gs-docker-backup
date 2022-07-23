#! /bin/sh

echo "Login in google..."
gcloud auth activate-service-account --key-file $GOOGLE_APPLICATION_CREDENTIALS

echo "Domping database ..."
DATE=`date +"%Y-%m-%d_%H-%M-%S"`
FILENAME="${DATE}.sql.gz"

pg_dump $DATABASE_URL | gzip > "/tmp/$FILENAME"

echo "Uploading dump to $GCS_BACKUP_BUCKET/$FILENAME ..."
gsutil cp "/tmp/$FILENAME" $GCS_BACKUP_BUCKET/$FILENAME
rm  "/tmp/$FILENAME" # delete old file
echo "SQL backup uploaded successfully."
