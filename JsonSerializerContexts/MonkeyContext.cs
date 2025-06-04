using System.Text.Json.Serialization;
using McpServer.Models; // Import Monkey record

namespace McpServer.JsonSerializerContexts;

[JsonSerializable(typeof(List<Monkey>))]
internal sealed partial class MonkeyContext : JsonSerializerContext {

}