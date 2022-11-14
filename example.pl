use JSON::XS;
use Try::Tiny;
use Data::Dumper;
use REST::Client;
 
my $host = "10.0.0.25";
my $route = "/api/requestagent";

# print $data;
my $form_data = "{\"cross_ref_id\":\"115165165156\",\"id_campaign\":\"10001\"}";

print Dumper($form_data);

my $rest = REST::Client->new({host => $host, timeout => 10});
$rest->addHeader('Content_Type', 'application/json');
$rest->POST($route, $form_data);

print "\r\n";
print Dumper($rest->responseCode());
print "\r\n";
print Dumper($rest->responseContent());
print "\r\n";

# return example: {"msg": "Sem agentes disponíveis", "results": {"id_campaign": 10001, "cross_ref_id": 115165165156}}
my $result = decode_json ($rest->responseContent()); #convert to json
print " >> msg: $result->{msg} \r\n";
print " >> id_campaign: $result->{results}{'id_campaign'} \r\n";
print " >> cross_ref_id: $result->{results}{'cross_ref_id'} \r\n";

