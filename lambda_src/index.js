exports.handler = async (event) => {
    const region_code = process.env.AWS_REGION;

    var body = {
        region: region_code
    };

    const response = {
        statusCode: 200,
        body: body
    };

    return response;
}