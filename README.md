# Google Cloud Storage Terraform module  
Terraform module for creation of Google Cloud Storage buckets

## Usage
<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_google"></a> [google](#requirement\_google)          | 4.24.0   |

## Providers
| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_google"></a> [google](#provider\_google) | 4.24.0  |

## Modules
No modules.

## Resources
| Name                                                                                                                        | Type     |
| --------------------------------------------------------------------------------------------------------------------------- | -------- |
| [google_storage_bucket.main](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs
| Name                                                                                      | Description                                                                                                         | Type          | Default                 | Required |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------- | ------------- | ----------------------- | :------: |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name)                     | Unique names for buckets.                                                                                           | `set(string)` | n/a                     |   yes    |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id)                        | The ID of the project to which the resource belongs.                                                                | `string`      | n/a                     |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services).                                                                | `string`      | n/a                     |   yes    |
| <a name="input_env"></a> [env](#input\_env)                                               | Variable to mark the environment of the resource (used to create services).                                         | `string`      | n/a                     |   yes    |
| <a name="input_location"></a> [location](#input\_location)                                | The geographic location where the bucket is located (for the main project).                                         | `string`      | n/a                     |   yes    |
| <a name="input_class"></a> [class](#input\_class)                                         | The Storage Class of the bucket. Can be set one of STANDARD, MULTI_REGIONAL, REGIONAL, NEARLINE, COLDLINE, ARCHIVE. | `string`      | <pre><br>STANDARD</pre> |    no    |
| <a name="input_delete_data"></a> [delete\_data](#input\_delete\_data)                     | If true delete all data in the buckets when the resource is destroying                                              | `bool`        | <pre><br>true</pre>     |    no    |
| <a name="versioning"></a> [versioning](#input\_versioning)                                | Assign versioning for Storage                                                                                       | `bool`        | <pre><br>true</pre>     |    no    |
| <a name="lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules)               | Assign lifecycle rule for Storage                                                                                   | `map(any)`    | {}                      |    no    |
| <a name="lifecycle_labels"></a> [lifecycle\_labels](#input\_lifecycle\_labels)            | The labels associated with this bucket. You can use these to organize and group your datasets                       | `map(string)` | {}                      |    no    |

## Outputs
| Name                                                                    | Description                         |
| ----------------------------------------------------------------------- | ----------------------------------- |
| <a name="output_bucket_url"></a> [bucket\_url](#output\_bucket\_url)    | The base URL of the storage bucket. |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The storage bucket name.            |
<!-- END_TF_DOCS -->

## License
Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-cloud-storage/blob/main/LICENSE)
