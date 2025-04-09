const {OAuth2Client} = require('google-auth-library');

const CLIENT_ID = '1014141380029-4nnv9u62tet3b35aq9hrqqcpnb4jqec2.apps.googleusercontent.com';
const CLIENT_SECRET = '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';
const REDIRECT_URI = '';

const client = new OAuth2Client(CLIENT_ID, CLIENT_SECRET, REDIRECT_URI);

const validarGoogleIdToken = async (token) => {
    try {
        const ticket = await client.verifyIdToken({
            idToken: token,
            audience: [
                CLIENT_ID,
                "1014141380029-h08nctuk74ipkqqk3l7sisjdf77tvvlt.apps.googleusercontent.com"
            ],  
        });

        console.log("Ticket obtenido");
        const payload = ticket.getPayload();

        console.log('============ PAYLOAD ============= ');
        console.log( payload );
        return { 
            name: payload['name'],
            picture: payload['picture'],
            email: payload['email']
        }
    } catch (error) {
        console.error('Error en verifyIdToken:', error);
        return null;
    }
}

module.exports = {
    validarGoogleIdToken
}