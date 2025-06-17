using ChangeEventStreaming.SqlStreaming;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

var configuration = new ConfigurationBuilder()
    .SetBasePath(Directory.GetCurrentDirectory())
    .AddJsonFile("appsettings.json", optional: false)
    .Build();

IServiceCollection services = new ServiceCollection();

var eventHubOptions = configuration.GetSection("Muflone:EventHub").Get<EventHubOptions>()
                      ?? throw new InvalidOperationException("EventHub configuration is missing");

var eventProcessorClient = EventStorePositionConsumerFactory.Build(eventHubOptions);
services.AddSingleton(eventProcessorClient);

using var cts = new CancellationTokenSource();
Console.CancelKeyPress += (_, e) => {
    e.Cancel = true;
    cts.Cancel();
};

var eventDispatcher = new EventDispatcher(eventProcessorClient);
await eventDispatcher.StartAsync(cts.Token);

Console.WriteLine("Event dispatcher started. Press Ctrl+C to exit...");
try {
    // Wait until cancellation is requested
    await Task.Delay(Timeout.Infinite, cts.Token);
}
catch (OperationCanceledException) {
    // Expected when cancellation occurs
}
finally {
    await eventDispatcher.StopAsync(CancellationToken.None);
}

Console.WriteLine("Hello, Change-Event-Streaming!");
Console.ReadKey();