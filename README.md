# SSL Certificate Extraction and Cleanup Script

This project provides a Bash script to streamline the extraction and management of SSL certificates and private keys from a `.pfx` file. It performs various cleanup operations and prepares the necessary files for deployment.

## Script Overview

### Purpose

- Remove clutter files.
- Extract the private key and certificate from a `.pfx` file.
- Verify the integrity of the extracted key and certificate.
- Chain the extracted certificate with a DigiCert authority certificate.
- Organize the final output and clean up the workspace.

### Prerequisites

- OpenSSL must be installed on your system.
- Ensure you have the `.pfx` file and the DigiCertCA.crt file in the working directory.
- Update the script with the correct password for your `.pfx` file.

## Usage Instructions

1. **Make the script executable**:

    ```bash
    chmod +x extract_ssl.sh
    ```

2. **Run the script**:

    ```bash
    ./extract_ssl.sh
    ```

## Notes

- Ensure to replace `##Welcome123` and `asdf` with the actual passwords used in your `.pfx` file.
- The script cleans up all intermediate files and only keeps the final `crt` and `key` in the `final` directory.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
