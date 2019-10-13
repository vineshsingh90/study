


**MongoDB**
> MongoDB is a cross-platform, document oriented database that provides, high performance, high availability, and easy scalability. MongoDB works on concept of collection and document.

**Database**
> Dataasse is a physical container for collections. Each database gets its own set of files on the file system. A single mongodb server typically has multiple databases.

**Collections**
> Collection is a group of MongoDB documents. It is the equivalent of an RDBMS table. A collection exists within a single database. Collections do not enforce a schema. Documents within a collection can have different fields. Typically, all documents in a collection are of similar or related purpose.

**Document**
> A document is a set of key-value pairs. Documents have dynamic schema. Dynamic schema means that documents in the same collection do not need to have the same set of fields or structure, and common fields in a collection's documents may hold different types of data.

**relationship of RDBMS terminology with MongoDB.**

RDBMS | MongoDB
----- | -------
Database | Database
Table | Collection
Tuple/Row | Document
column | Field
Table Join | Embedded Documents
Primary Key | Primary Key (Default key _id provided by mongodb itself


**Database Server and Client**

Mysqld/Oracle	| mongod
--------------|-------
Mysqld | Oracle	mongod
mysql |sqlplus	mongo


**Sample Document**

```json
{
   _id: ObjectId(7df78ad8902c)
   title: 'MongoDB Overview', 
   description: 'MongoDB is no sql database',   
   comments: [
      {user:'user1', message: 'My first comment'},
      {user:'user2', message: 'My second comments'}
   ]
}
```
> _id is a 12 bytes hexadecimal number which assures the uniqueness of every document. You can provide _id while inserting the document. If you don’t provide then MongoDB provides a unique id for every document. These 12 bytes first 4 bytes for the current timestamp, next 3 bytes for machine id, next 2 bytes for process id of MongoDB server and remaining 3 bytes are simple incremental VALUE.

****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
v****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>
****
>

