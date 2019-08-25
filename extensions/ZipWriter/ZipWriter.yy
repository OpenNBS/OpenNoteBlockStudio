{
    "id": "a3feae56-9d2c-4f64-a9d2-1c7122c797a9",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "ZipWriter",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 105554163798254,
    "date": "2019-40-24 01:08:57",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "07dee1d6-de64-4154-944b-8863558b1a4c",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "zip_writer.gml",
            "final": "",
            "functions": [
                {
                    "id": "6e5c5b9e-c39d-4b2f-ada5-2a748faafd7b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_impl_crc32",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_impl_crc32",
                    "returnType": 2
                },
                {
                    "id": "49e2e8ce-1850-45ed-859a-f89b7c1fdd22",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_impl_write",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_impl_write",
                    "returnType": 2
                },
                {
                    "id": "ca6fc13b-d711-4bb9-882c-e362ac9ca866",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "zip_create",
                    "help": "zip_create(compressionLevel:int = -1)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_create",
                    "returnType": 2
                },
                {
                    "id": "a94e799a-87a3-45db-8040-2f6791fda33b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "zip_destroy",
                    "help": "zip_destroy(this:zip)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_destroy",
                    "returnType": 2
                },
                {
                    "id": "9e3f8056-ce0f-42e2-ae34-fa2b0171bf6f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        2,
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_add_buffer_ext",
                    "help": "zip_add_buffer_ext(this:zip, path:string, buf:buffer, pos:int, len:int)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_add_buffer_ext",
                    "returnType": 2
                },
                {
                    "id": "1139fe62-a2c8-4d9c-88ab-2850ebb8662c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_add_buffer",
                    "help": "zip_add_buffer(this:zip, path:string, buf:buffer)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_add_buffer",
                    "returnType": 2
                },
                {
                    "id": "67613d24-d18a-49c0-9d56-08fd6087c504",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "zip_add_file",
                    "help": "zip_add_file(this:zip, path:string, filePath:string)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_add_file",
                    "returnType": 2
                },
                {
                    "id": "a54176cb-d81f-44c4-9ce1-ea20c795dea4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "zip_finalize",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_finalize",
                    "returnType": 2
                },
                {
                    "id": "fa9326e1-ab57-4d28-92a5-b81682359892",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "zip_save",
                    "help": "zip_save(this:zip, path:string) : Finalizes and saves the contents of this ZIP to given file",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_save",
                    "returnType": 2
                },
                {
                    "id": "4871d8c1-8f5d-4484-b0a5-ae59dad6b3dc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "zip_get_buffer",
                    "help": "zip_get_buffer(this:zip)->buffer : Finalizes and returns this ZIP's buffer (note: destroyed by zip_destroy - make a copy)",
                    "hidden": false,
                    "kind": 11,
                    "name": "zip_get_buffer",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "6e5c5b9e-c39d-4b2f-ada5-2a748faafd7b",
                "49e2e8ce-1850-45ed-859a-f89b7c1fdd22",
                "ca6fc13b-d711-4bb9-882c-e362ac9ca866",
                "a94e799a-87a3-45db-8040-2f6791fda33b",
                "9e3f8056-ce0f-42e2-ae34-fa2b0171bf6f",
                "1139fe62-a2c8-4d9c-88ab-2850ebb8662c",
                "67613d24-d18a-49c0-9d56-08fd6087c504",
                "a54176cb-d81f-44c4-9ce1-ea20c795dea4",
                "fa9326e1-ab57-4d28-92a5-b81682359892",
                "4871d8c1-8f5d-4484-b0a5-ae59dad6b3dc"
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosdelegatename": "",
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "F3D00DAD3DDB83EFFDD568E8093FC7AA",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosdelegatename": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.0"
}