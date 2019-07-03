'use strict';

const express = require('express');
const bodyParser = require('body-parser');
const router = express.Router();

// Routes

// Login Page
router.get('/', (req, res) => {
    let message = '';
    res.render('login', {
        email  : req.session.email,
        message: message,
        pageId: 'login',
        title: 'Welcome | Login',
        //formValues: { email: null, password: null },
    })
});

router.post('/login', (req, res) => {
    let message = 'db error';
    let sess = req.session;
    
    if(req.method == 'POST'){
        let post = req.body;
        let email = post.email;
        let password = post.password;
        let loginQuery = "SELECT * FROM `users` WHERE `email` = '" + email + "' and password = '"+ password + "'";
        db.query(loginQuery, (err, results) => {
    if(results.user_role === 'emp'){
        req.session.email = results[0].email;
        req.session.user = results[0];
        res.redirect('/tickets');
        console.log(results);
    }
    else if(results[0].user_role === 'user'){
        req.session.email = results[0].email;
        req.session.user = results[0];
        res.redirect('/user_dashboard');
    }
    else {
        message = 'Wrong Credentials.';
        res.render('login', {
            message: message,
            pageId: 'login',
            title: 'Welcome | Login',
        });
        }
    });
    }
    else {
        res.render('login', {
            message: message,
            pageId: 'login',
            title: 'Welcome | Login',
    });
    }
})

// Register Page
router.get('/register', (req, res) => {
    res.render('register', {
        email  : req.session.email,
        pageId: 'register',
        title: 'Register',
    })
});

// Create a new ticket
router.get('/createnewticket', (req, res) => {
    res.render('createNewTicket', {
        email  : req.session.email,
        pageId: 'createNewTicket',
        title: 'Create New Ticket',
    })
});

router.post('/createnewticket',  (req, res) => {
    let email = req.body.email;
    let userId = req.body.userId;
    let status = req.body.status;
    let subject = req.body.subject;
    let details = req.body.details;
    let createTicket = "INSERT INTO `tickets` (ticket_id, user_id, status, subject, date_created, details, email) VALUES (NULL, '" + userId + "', '" + status + "', '" + subject + "', CURRENT_TIMESTAMP(), '" + details + "', '" + email + "')";
db.query(createTicket, (err, result) => {
    if (err) {
        return res.status(500).send(err);
    } else {
        res.redirect(`/user_dashboard`);
        }
    })
});

router.post('/tickets', (req, res) => {

});

// router.get('/ticketDetails', (req, res,) => {
//     res.render('ticketDetails', {
//         pageId: 'ticketDetails',
//         title: 'Ticket Details',
//     });
// });
// Ticket Details
router.get('/ticketDetails/:ticket_id', (req, res) => {
    
    let ticket_id = req.params.ticket_id;
    let getTicketQuery = "SELECT ticket_id, email, date_created, status, subject, details FROM `tickets` WHERE `ticket_id` = '" + ticket_id + "'";
    db.query(getTicketQuery, (err, result) => {
        if (err) {
            return res.status(500).send(err);
    } else {
            res.render('ticketDetails', {
                email  : req.session.email,
                pageId: 'ticketDetails',
                title: 'Ticket Details',
                'ticket': result,
        })
    console.log(result);
    }
    })
});

router.post('/ticketDetails/:ticket_id',  (req, res) => {
    let ticket_id = req.params.ticket_id;
    let user_id = req.body.user_id;
    let status = req.body.status;
    let subject = req.body.subject;
    let details = req.body.details;
    let updateTicketDetails = "UPDATE `tickets` SET `ticket_id` = '" + ticket_id + "', `user_id` = '" + user_id + "', `status` = '" + status + "', `subject` = '" + subject + "', `details` = '" + details + "', ";
    //let updateTicketDetails = "INSERT INTO `tickets` (ticket_id, user_id, status, subject, details, date_updated, date_created) VALUES ('" + ticket_id + "', " + user_id + "', " + status + "'," + subject + "', " + details + "', CURRENT_TIMESTAMP(), null";
db.query(updateTicketDetails, (err, result) => {
    if (err) {
        return res.status(500).send(err);
    } else {
        res.redirect('/user_dashboard/:ticket_id');
        }
    })
});

// All Tickets Page
router.get('/tickets', (req, res) => {
    res.render('tickets', {
        email  : req.session.email,
        pageId: 'tickets',
        title: 'Tickets',
    })
});

router.post('/user_dashboard', (req, res, next) => {
    let user = req.session.user;
    let post = req.body;
    let email = post.email;
    let getUserTickets = "SELECT * FROM `tickets` WHERE `email` = '" + email + "'";
//console.log(email);
console.log(post);
//console.log(post.userId);
    db.query(getUserTickets, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        } else {
        res.render('user_dashboard', {
            email: email,
            pageId: 'user_dashboard',
            title: 'User Dashboard',
            userX: results,
        })
    }  
})
})


// User Dashboard
// router.get('/user_dashboard', (req, res) => {
//     res.render('user_dashboard', {
//         pageId: 'user_dashboard',
//         title: 'Open Tickets',
//     })
// });

// router.post('/user_dashboard', (req, res, next) => {
//     let user = req.session.user;
//     let post = req.body;
//     let userId = post.user_id;
//     let getUserTickets = "SELECT * FROM `tickets` WHERE `user_id` = '" + userId + "'";
  
//       db.query(getUserTickets, (err, results) => {
//         if (err) {
//           return res.status(500).send(err);
//         }
//         res.render('user_dashboard', {
//           user: user,
//           pageId: 'user_dashboard',
//           title: results[0].first_name,
//           patientX: results[0],
//         })
//   })
//   })

// router.get('/user_dashboard/:user_id', (req, res) => {
//     let user_id = req.params.user_id;
//     let getUserTickets = "SELECT * FROM `tickets` WHERE `user_id` = '" + user_id + "' ORDER BY date_created DESC";
//     console.log(user_id);
//     db.query(getUserTickets, (err, result) => {
//     if (err) {
//         return res.status(500).send(err);
//     } else {
//             res.render('user_dashboard', {
//             pageId: 'user_dashboard',
//             title: 'User Dashboard',
//             'sql': result,
//     })
//     }
//         console.log(result);
//     })
//   });

// router.get('/user_dashboard', (req, res) => {
//     let user = req.session.user;
//     let userId = req.session.userId;

//     if(userId === null){
//         res.redirect('/', {
//             message: message,
//             pageId: 'login',
//             title: 'Welcome | Login',
//     });
//     console.log(userId);
//     }
//     let getUserTickets="SELECT * FROM `tickets` WHERE `user_id` = '" + userId + "'"
//     db.query(getUserTickets, (err, results) => {

//         res.render('user_dashboard', {
//             user: user,
//             userX: results[0],
//             pageId: 'user_dashboard',
//             title: 'User Dashboard',
//         })
//     })
// });

// router.get('/', (req, res,) => {
//     let message = '';
//       res.render('login', {
//         message: message,
//         pageId: 'login',
//         title: 'Login',
//       })
//     });
//   // login route 
//   router.post('/login', (req, res) => {
//     let message = 'db error';
//     let sess = req.session;
  
//     if(req.method == 'POST'){
//       let post = req.body;
//       let name = post.user_name;
//       let pass = post.password;
//       let loginQuery = "SELECT * FROM `users` WHERE `userName` = '"+name+"' and password = '"+pass+"'";
//       db.query(loginQuery, (err, results) => {
//         if(results[0].accountType === 'emp'){
//           req.session.userId = results[0].user_id;
//           req.session.user = results[0];
//           res.redirect('/tickets');
//         }
//         else if(results[0].accountType === 'user'){
//           req.session.userId = results[0].user_id;
//           req.session.user = results[0];
//           res.redirect('/user_dashboard');
//         }
//         else {
//           message = 'Wrong Credentials.';
//           res.render('login.ejs', {
//             message: message,
//             pageId: 'login',
//             title: 'Welcome',
//           });
//         }
//       });
//     }
//     else {
//       res.render('login.ejs', {
//         message: message,
//         pageId: 'login',
//         title: 'Welcome',
//       });
//     }
//   })

// router.post('/login', (req, res) => {
// 	let query = 'SELECT email FROM users WHERE email =?';
// 	db.query(query, [ req.body.email ], (error, dbEmail, fields) => {
// 		if (req.body.email !== dbEmail[0].email) {
// 			res.redirect('/');
// 		} else {
// 			let query = 'SELECT password FROM users WHERE email =?';
// 			db.query(query, [ req.body.email ], (error, dbPassword, fields) => {
// 				if (req.body.password !== dbPassword[0].password) {
// 					res.redirect('/');
// 				} else {
// 					req.session.email = req.body.email;
// 					res.redirect('/tickets');
//                 }
//                 console.log(dbEmail, dbPassword);
// 			});
// 		}
// 	});
// });



// router.get('/', (req, res,) => {
//     let message = '';
//       res.render('welcome', {
//         message: message,
//         pageId: 'welcome',
//         title: 'Welcome',
//       })
//     });
//   // login route 
//   router.post('/login', (req, res) => {
//     let message = 'db error';
//     let sess = req.session;
  
//     if(req.method == 'POST'){
//       let post = req.body;
//       let name = post.user_name;
//       let pass = post.password;
//       let loginQuery = "SELECT * FROM `users` WHERE `userName` = '"+name+"' and password = '"+pass+"'";
//       db.query(loginQuery, (err, results) => {
//         if(results[0].user_role === 'admin'){
//           req.session.userId = results[0].user_id;
//           req.session.user = results[0];
//           res.redirect('/tickets');
//         }
//         else if(results[0].user_role === 'user'){
//           req.session.userId = results[0].user_id;
//           req.session.user = results[0];
//           res.redirect('/user_dashboard');
//         }
//         else {
//           message = 'Wrong Credentials.';
//           res.render('welcome.ejs', {
//             message: message,
//             pageId: 'welcome',
//             title: 'Welcome',
//           });
//         }
//       });
//     }
//     else {
//       res.render('welcome.ejs', {
//         message: message,
//         pageId: 'welcome',
//         title: 'Welcome',
//       });
//     }
//   })

module.exports = router;
