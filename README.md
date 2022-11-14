# Google Cloud Storage Terraform module  
Terraform module for creation Azure Google Cloud Storage buckets

## Usage
<!-- BEGIN_TF_DOCS -->
## Requirements
| Name                                                                      | Version   |
| ------------------------------------------------------------------------- | --------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0  |
| <a name="requirement_google"></a> [google](#requirement\_google)          | >= 4.24.0 |

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
| Name                                                                                      | Description                                                                    | Type          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Required |
| ----------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------ | ------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name)                     | A unique IDs for buckets                                                       | `set(string)` | [ ]                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |   yes    |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id)                        | The ID of the project to which the resource belongs                            | `string`      | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |   yes    |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services)                            | `string`      | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |   yes    |
| <a name="input_location"></a> [location](#input\_location)                                | The geographic location where the bucket is located (for the main project)     | `string`      | n/a                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |   yes    |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class)               | The Storage Class of the bucket                                                | `string`      | <pre><br>STANDARD</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |    no    |
| <a name="input_delete_data"></a> [delete\_data](#input\_delete\_data)                     | If set to true, delete all data in the buckets when the resource is destroying | `bool`        | <pre><br>true</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |    no    |
| <a name="versioning"></a> [versioning](#input\_versioning)                                | Assign versioning for Storage                                                  | `bool`        | <pre><br>true</pre>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |    no    |
| <a name="lifecycle_rules"></a> [lifecycle\_rules](#input\_lifecycle\_rules)               | Assign lifecycle rule for Storage                                              | `map(any)`    | <pre>{<br> lifecycle_rule_01 = {<br>   with_state                 = "ARCHIVED"<br>   num_newer_versions         = 2<br>   days_since_noncurrent_time = null<br>   storage_class              = ""<br>   type                       = "Delete"<br> }<br> lifecycle_rule_02 = {<br>   with_state                 = ""<br>   num_newer_versions         = null<br>   days_since_noncurrent_time = 7<br>   storage_class              = ""<br>   type                       = "Delete"<br> }<br>}</pre> |    no    |

## Outputs
| Name                                                                                   | Description                  |
| -------------------------------------------------------------------------------------- | ---------------------------- |
| <a name="output_raw_bucket"></a> [raw\_bucket](#output\_raw\_bucket)                   | Raw storage bucket url       |
| <a name="output_temp_bucket"></a> [temp\_bucket](#output\_temp\_bucket)                | Temp storage bucket url      |
| <a name="output_artifacts_bucket"></a> [artifacts\_bucket](#output\_artifacts\_bucket) | Artifacts storage bucket url |
<!-- END_TF_DOCS -->

## License
Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-google-cloud-storage/blob/main/LICENSE)
