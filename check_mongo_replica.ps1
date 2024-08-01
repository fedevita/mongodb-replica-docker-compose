# check_mongo_replica.ps1

param (
    [string]$mongoHost = "localhost",
    [int]$mongoPort = 27017
)

# Function to check replica set status
function Check-ReplicaSetStatus {
    param (
        [string]$mongoInstanceHost,
        [int]$mongoInstancePort
    )

    try {
        $status = & mongosh --quiet --host $mongoInstanceHost --port $mongoInstancePort --eval "rs.status()"
        $statusJson = $status | ConvertFrom-Json

        if ($statusJson.ok -eq 1) {
            Write-Output "Replica set is configured correctly. Status:"
            Write-Output $statusJson
        } else {
            Write-Output "Replica set configuration failed. Status:"
            Write-Output $statusJson
        }
    } catch {
        Write-Output "Failed to connect to MongoDB instance at ${mongoInstanceHost}:${mongoInstancePort}"
        Write-Output $_.Exception.Message
    }
}

# Check the replica set status
Check-ReplicaSetStatus -mongoInstanceHost $mongoHost -mongoInstancePort $mongoPort
