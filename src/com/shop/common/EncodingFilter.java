package com.shop.common;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Servlet Filter implementation class EncodingFilter
 * �������봦�������
 * @author tianheli
 */
@WebFilter("/EncodingFilter")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// ת��Ϊ��Э����ض���
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		// ��request��װ��ǿ
		HttpServletRequest myrequest = new MyRequest(httpServletRequest);
		// pass the request along the filter chain�ѹ���������һ��������������Դ������
		chain.doFilter(myrequest, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	

}
//�Զ���request����
	class MyRequest extends HttpServletRequestWrapper {
	 
		private HttpServletRequest request;
	 
		private boolean hasEncode;
	 
		public MyRequest(HttpServletRequest request) {
			super(request);// super����д
			this.request = request;
		}
	 
		// ����Ҫ��ǿ���� ���и���
		@Override
		public Map getParameterMap() {
			// �Ȼ������ʽ
			String method = request.getMethod();
			if (method.equalsIgnoreCase("post")) {
				// post����
				try {
					// ����post����
					request.setCharacterEncoding("utf-8");
					return request.getParameterMap();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			} else if (method.equalsIgnoreCase("get")) {//tomcat8.5�Ѿ�������get���Ŀ��Խ�get�еĴ���ע�͵�
				// get����
				Map<String, String[]> parameterMap = request.getParameterMap();
				if (!hasEncode) { // ȷ��get�ֶ������߼�ֻ����һ��
					for (String parameterName : parameterMap.keySet()) {
						String[] values = parameterMap.get(parameterName);
						if (values != null) {
							for (int i = 0; i < values.length; i++) {
								try {
									// ����get����
									values[i] = new String(values[i].getBytes("ISO-8859-1"), "utf-8");
								} catch (UnsupportedEncodingException e) {
									e.printStackTrace();
								}
							}
						}
					}
					hasEncode = true;
				}
				return parameterMap;
			}
	 
			return super.getParameterMap();
		}
	 
		public String getParameter(String name) {
			Map<String, String[]> parameterMap = getParameterMap();
			String[] values = parameterMap.get(name);
			if (values == null) {
				return null;
			}
			return values[0]; // ȡ�ز����ĵ�һ��ֵ
		}
	 
		public String[] getParameterValues(String name) {
			Map<String, String[]> parameterMap = getParameterMap();
			String[] values = parameterMap.get(name);
			return values;
		}
	}
