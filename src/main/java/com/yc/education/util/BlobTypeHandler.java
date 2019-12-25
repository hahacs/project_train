package com.yc.education.util;

import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BlobTypeHandler extends BaseTypeHandler<String> {

    private static final String DEFAULT_CHARSET = "utf-8";

    @Override

    public void setNonNullParameter(PreparedStatement ps, int i, String parameter, JdbcType paramJdbcType)
    throws SQLException {

        try {

            ByteArrayInputStream bis = new ByteArrayInputStream(parameter.getBytes(DEFAULT_CHARSET));

            ps.setBinaryStream(i, bis, parameter.length());

        } catch (UnsupportedEncodingException e) {

        e.printStackTrace();

        }

    }

    @Override
    public String getNullableResult(ResultSet rs, String columnName) throws SQLException {

        Blob blob = rs.getBlob(columnName);

        byte[] returnValue = null;

        String result = null;

        if (null != blob) {
            returnValue = blob.getBytes(1L, (int)blob.length());
        }

        try {
            if (returnValue != null) {
                result = new String(returnValue, DEFAULT_CHARSET);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return result;

    }

    @Override

    public String getNullableResult(ResultSet rs, int columnIndex) throws SQLException {

        Blob blob = rs.getBlob(columnIndex);
        byte[] returnValue = null;
        String result = null;
        if (null != blob) {
            returnValue = blob.getBytes(1L, (int)blob.length());
        }

        try {

            if (returnValue != null) {
                result = new String(returnValue, DEFAULT_CHARSET);
            }
        } catch (UnsupportedEncodingException e) { e.printStackTrace(); }

        return result;

    }

    @Override
    public String getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {

        Blob blob = cs.getBlob(columnIndex);

        byte[] returnValue = null;

        String result = null;

        if (null != blob) {
            returnValue = blob.getBytes(1L, (int)blob.length());
        }

        try {
            if (returnValue != null) {
                result = new String(returnValue, DEFAULT_CHARSET);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return result;

    }

}


