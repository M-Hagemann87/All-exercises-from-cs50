# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

1 - This approach does not overload just one boat, because it distributes the information evenly.
2 - The drawback of this approach is not having redundancy, if one boat is lost/broken, the information access is lost too.

## Partitioning by Hour

1 - This approach makes the information distribution faster (e.g. query), because it needs to be searched on only one boat, if, for example, the query is based on the hour of the information/data that is being collected.
2 - It also does not have redundancy, so if one boat is lost/broken, the information is lost too.
3 - Another drawback is that it overloads one boat while another is completely free of information/data.

## Partitioning by Hash Value

1 - For some queries (if you know the specific information/data time), it will be faster to find it because the data has a better identification system, so it will search in only one boat.
2 - For some other queries, for example, if what to know every single information/data from midnight to 1 am, it will need to read/search on all the boats to find these information, so it might take more time than the "partitioning by hour" for example.
