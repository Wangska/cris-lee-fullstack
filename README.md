# Piggery Farm Management System

A comprehensive web-based management system for pig farming operations, built with PHP and MySQL.

## Features

- **Pig Management**: Track individual pigs, health status, and breeding records
- **Growth Tracking**: Monitor pig growth phases from piglets to mature pigs
- **Sales Management**: Handle sales, orders, and customer relationships
- **Admin Dashboard**: Comprehensive admin interface for system management
- **User Management**: Customer registration and management
- **Breeding Records**: Track breeding activities and outcomes

## Database Structure

The system uses MySQL with the following main tables:
- `admin` - System administrators
- `piglets` - Individual pig records
- `tblpigbreeders` - Breeding pig records
- `tblorders` - Sales orders
- `tblusers` - Customer accounts
- `breeder_records` - Breeding activity logs

## Installation

### Using Docker (Recommended for Coolify)

1. Clone the repository
2. Copy `env.example` to `.env` and update database credentials
3. Run the database import:
   ```bash
   mysql -u root -p default < "piggeryfarm (1).sql"
   ```
4. Build and run with Docker:
   ```bash
   docker-compose up -d
   ```

### Manual Installation

1. Set up a web server with PHP 8.2+ and MySQL
2. Import the SQL file: `piggeryfarm (1).sql`
3. Update database credentials in `Piggery/config/database.php`
4. Deploy files to your web server

## Environment Variables

```env
DB_CONNECTION=mysql
DB_DATABASE=default
DB_HOST=your_database_host
DB_PASSWORD=your_database_password
DB_PORT=3306
DB_USERNAME=root
```

## Default Admin Credentials

- Username: `admin`
- Password: `admin` (MD5 hashed in database)

## File Structure

```
├── Dockerfile                 # Docker configuration
├── docker-compose.yml        # Docker Compose configuration
├── env.example              # Environment variables template
├── piggeryfarm (1).sql      # Database schema and data
├── Piggery/                  # Main application directory
│   ├── config/
│   │   └── database.php      # Database connection
│   ├── admin/                # Admin interface
│   │   ├── login.php
│   │   ├── dashboard.php
│   │   └── logout.php
│   └── index.php            # Main application entry point
└── README.md
```

## Deployment with Coolify

1. Connect your Git repository to Coolify
2. Set the environment variables in Coolify dashboard
3. Deploy using the provided Dockerfile
4. Import the SQL file to your database

## Features Overview

### Admin Dashboard
- System statistics and overview
- Pig management interface
- User management
- Order tracking
- Breeding records management

### Customer Features
- Pig browsing and selection
- Order placement
- Account management

## Database Issues Fixed

- Updated database name from `piggeryfarm` to `default`
- Fixed AUTO_INCREMENT issues in table definitions
- Updated timestamp defaults to use CURRENT_TIMESTAMP
- Added proper PRIMARY KEY constraints
- Standardized character set to utf8mb4

## Requirements

- PHP 8.2+
- MySQL 5.7+ or MariaDB 10.3+
- Apache or Nginx web server
- Docker (for containerized deployment)

## Support

For issues and support, please check the application logs and ensure all environment variables are properly configured.
