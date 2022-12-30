#!/bin/bash
while read machine;
do
  echo $machine
  {
    {
      gcloud compute ssh --zone "us-central1-f" \
                        "$machine" \
                        --project "hydrobuilder-213520" \
                        --command 'sudo rm -rf /home/yesh*' &&
      echo "$machine: Done!"
    } || {
      echo "$machine: Skipped!"
    }
  }&
done < inventory.txt
