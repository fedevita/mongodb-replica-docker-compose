## MongoDB Replica Set Setup with Docker Compose

This README file provides instructions on how to set up a MongoDB replica set using Docker Compose, verify the setup, and connect to the cluster using MongoDB Compass.

### Prerequisites

- Docker
- Docker Compose

### Steps to Set Up MongoDB Replica Set

1. **Clone the Repository**
   ```sh
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Create and Start the Containers**
   Run the following command to start the MongoDB containers:
   ```sh
   docker-compose up -d --build
   ```

3. **Verify the Replica Set Configuration**
   To ensure the replica set is configured correctly, run the following command:
   ```sh
   docker exec -it mongo1 mongo --eval "rs.status()"
   ```
   You should see output similar to:
   ```json
   {
     "set": "rs0",
     "date": ISODate("2024-08-01T13:33:12Z"),
     "myState": 1,
     "members": [
       {
         "_id": 0,
         "name": "mongo1:27017",
         "state": 1,
         "stateStr": "PRIMARY",
         ...
       },
       {
         "_id": 1,
         "name": "mongo2:27017",
         "state": 2,
         "stateStr": "SECONDARY",
         ...
       },
       {
         "_id": 2,
         "name": "mongo3:27017",
         "state": 2,
         "stateStr": "SECONDARY",
         ...
       }
     ],
     "ok": 1
   }
   ```

### Connecting to MongoDB Replica Set with MongoDB Compass

1. **Open MongoDB Compass**

2. **Create a New Connection**

3. **Enter the Connection Details**
   - **Hostname**: `mongo1`
   - **Port**: `27017`
   - **Replica Set Name**: `rs0`
   - **Additional Members**: 
     - `mongo2:27017`
     - `mongo3:27017`
   
   Example connection string format:
   ```
   mongodb://mongo1:27017,mongo2:27017,mongo3:27017/?replicaSet=rs0
   ```

### Additional Information

- Ensure that Docker and Docker Compose are installed and running on your machine.
- Ensure that the `mongo` or `mongosh` command-line tools are installed and available in your system's `PATH`.