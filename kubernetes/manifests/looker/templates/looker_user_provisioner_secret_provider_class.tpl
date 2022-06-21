# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

apiVersion: secrets-store.csi.x-k8s.io/v1
kind: SecretProviderClass
metadata:
  name: looker-user-provisioning-secrets
spec:
  provider: gcp
  parameters:
    secrets: |
      - resourceName: "projects/${project_id}/secrets/${user_provisioning_secret_name}/versions/latest"
        fileName: user_provision
  secretObjects:
    - data:
        - key: provisioner
          objectName: user_provision
      secretName: looker-user-provision
      type: Opaque
