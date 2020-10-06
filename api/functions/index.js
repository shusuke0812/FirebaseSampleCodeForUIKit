const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

// addMessage関数を追加
exports.addMessage = functions.https.onRequest(async (req, res) => {
	const original = req.query.text;
	const writeResult = await admin.firebase().collection('message').add({ original: original });
	res.json({ result: `Message with ID: ${writeResult.id} added.` });
});
