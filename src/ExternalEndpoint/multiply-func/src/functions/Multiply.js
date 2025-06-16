const { app } = require('@azure/functions');

app.http('Multiply', {
    methods: ['GET', 'POST'],
    authLevel: 'anonymous',
    handler: async (request, context) => {
        context.log(`Http function processed request for url "${request.url}"`);

        const numberAsText = request.query.get('number') || await request.text || '2';
        const number = parseInt(numberAsText, 10);
        if (isNaN(number)) {
            return { status: 400, body: 'Invalid number provided.' };
        }

        const result = number * 2;
        return {
            status: 200,
            body: JSON.stringify({ result }), // returns JSON like { "result": 10 }
            headers: { 'Content-Type': 'application/json' }
        };
    }
});
