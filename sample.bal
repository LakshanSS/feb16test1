import ballerina/http;
import ballerina/log;

type Greeting record {
    string 'from;
    string to;
    string message;
};

configurable string fromName = "Choreo";

service / on new http:Listener(8090) {
    resource function get .(string name) returns Greeting {
        log:printInfo(fromName);
        Greeting greetingMessage = {"from" : fromName, "to" : name, "message" : "Welcome to Choreo!"};
        return greetingMessage;
    }
}
