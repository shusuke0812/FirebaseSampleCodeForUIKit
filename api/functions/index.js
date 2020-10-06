const functions = require('firebase-functions');

const admin = require('firebase-admin');
admin.initializeApp();

// addMessage関数を追加
exports.addMessage = functions.https.onRequest(async (req, res) => {
	const original = req.query.text;
	const writeResult = await admin.firebase().collection('message').add({ original: original });
	res.json({ result: `Message with ID: ${writeResult.id} added.` });
});

// makeUppercase関数を追加
exports.makeUppercase = functions.firestore.document('/messages/{documentId}').onCreate( (snap, context) => {
	const original = snap.data().original;
	functions.logger.log('Uppercasing', context.params.documentId, original);
	
	const uppercase = original.toUpperCase();
	return snap.ref.set({ uppercase }, { merge: true });
});
