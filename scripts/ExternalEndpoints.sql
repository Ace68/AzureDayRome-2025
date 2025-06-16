DECLARE @response NVARCHAR(MAX);
DECLARE @returnCode INT;

EXEC @returnCode = sp_invoke_external_rest_endpoint
  @url = N'https://externalmultiplier.azurewebsites.net/api/Multiply?number=5',
  @method = N'GET',
  @response = @response OUTPUT;

SELECT JSON_VALUE(@response, '$.result.result') AS MultipliedValue;