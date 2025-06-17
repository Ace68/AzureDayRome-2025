module.exports = async function (context, req) {
    const number = parseFloat(req.query.number);

    if (isNaN(number)) {
        context.res = {
            status: 400,
            body: "Invalid number"
        };
        return;
    }

    const result = number * 2;

    context.res = {
        status: 200,
        headers: {
            'Content-Type': 'text/plain'
        },
        body: result.toString()
    };
};
