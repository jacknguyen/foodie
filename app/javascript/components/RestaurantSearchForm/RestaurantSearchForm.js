import React from 'react';
import { Formik, useField } from 'formik';
import { Container, Form, Button } from 'react-bootstrap';
import * as Yup from 'yup';

const MyTextInput = ({label, ...props}) => {
  const [field, meta] = useField(props);
  return (
    <Form.Group className="col-md-12 mb-2">
      <Form.Label className='sr-only'>{label}</Form.Label>
      <Form.Control
        size='lg'
        {...field}
        {...props}
        isInvalid={meta.touched && meta.error} />
      <Form.Control.Feedback type='invalid'>
        {meta.error}
      </Form.Control.Feedback>
    </Form.Group>
  )
}

const RestaurantSearchForm = (props) => (
  <>
    <Container>
      <Formik
        initialValues={{
          term: '',
          zip_code: ''
        }}
        validationSchema={Yup.object({
          term: Yup.string(),
          zip_code: Yup.string()
            .required()
            .length(5, 'Must be exactly 5 characters')
        })}
        onSubmit={ values => {
          props.submit(values)
        }}>
          {({handleSubmit}) => (
            <Form noValidate onSubmit={handleSubmit}>
              <Form.Row>
                <MyTextInput
                  label='Zip Code'
                  type='text'
                  name='zip_code'
                  placeholder='Zip Code' />
              </Form.Row>

              <Form.Row>
                <MyTextInput
                  label='Term'
                  type='text'
                  name='term'
                  placeholder='Cafe, Acai' />
              </Form.Row>

              <Button type="submit">
                Submit
              </Button>
            </Form>
          )}
      </Formik>
    </Container>
  </>
)

export default RestaurantSearchForm;
