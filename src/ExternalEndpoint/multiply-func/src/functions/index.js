module.exports = async function (context, req) {
    const number = parseFloat(req.query.number);

    if (isNaN(number)) {
        context.res = {
            status: 400,
            body: { error: "Invalid number" }
        };
        return;
    }

    const result = number * 2;

    context.res = {
        status: 200,
        headers: { 'Content-Type': 'application/json' },
        body: { result } // <-- Return as JSON
    };
};
