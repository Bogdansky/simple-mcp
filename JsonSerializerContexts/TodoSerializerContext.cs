using System.Text.Json.Serialization;
using McpServer.Models; // Import Monkey record

namespace McpServer.JsonSerializerContexts;

[JsonSerializable(typeof(Todo[]))]
internal partial class AppJsonSerializerContext : JsonSerializerContext
{

}